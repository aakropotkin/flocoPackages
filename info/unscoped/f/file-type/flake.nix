{

  inputs.packument.url   = "https://registry.npmjs.org/file-type?rev=225-a932ff2932e91cd88d7c127c38803260";
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
    ident = "file-type";
    ldir  = "info/unscoped/f/file-type";
    inherit packument fetchInfo;
  } // latest';

}
