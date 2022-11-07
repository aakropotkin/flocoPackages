{

  inputs.packument.url   = "https://registry.npmjs.org/babel-import-util?rev=7-68a25886c54fe5277f93f434f94ad7dc";
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
    ident = "babel-import-util";
    ldir  = "info/unscoped/b/babel-import-util";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
