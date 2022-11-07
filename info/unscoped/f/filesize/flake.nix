{

  inputs.packument.url   = "https://registry.npmjs.org/filesize?rev=216-bb1bc770ad0fd3c0900c0f69e44a60f3";
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
    ident = "filesize";
    ldir  = "info/unscoped/f/filesize";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
