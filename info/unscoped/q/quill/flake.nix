{

  inputs.packument.url   = "https://registry.npmjs.org/quill?rev=163-4d94292af5e51c8b427b6a4e1627a66e";
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
    ident = "quill";
    ldir  = "info/unscoped/q/quill";
    inherit packument fetchInfo;
  } // latest';

}
