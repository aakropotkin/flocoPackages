{

  inputs.packument.url   = "https://registry.npmjs.org/enzyme-adapter-react-16?rev=59-8dd8c156242703765a92887767110157";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "enzyme-adapter-react-16";
    ldir  = "info/unscoped/e/enzyme-adapter-react-16";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
