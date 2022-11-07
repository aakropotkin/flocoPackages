{

  inputs.packument.url   = "https://registry.npmjs.org/react-shallow-renderer?rev=31-3b74407d958345f764cabca469f46830";
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
    ident = "react-shallow-renderer";
    ldir  = "info/unscoped/r/react-shallow-renderer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
