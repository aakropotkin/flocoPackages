{

  inputs.packument.url   = "https://registry.npmjs.org/lazy?rev=25-7861c75c8fc1fbed148610ab4b0052d4";
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
    ident = "lazy";
    ldir  = "info/unscoped/l/lazy";
    inherit packument fetchInfo;
  } // latest';

}
