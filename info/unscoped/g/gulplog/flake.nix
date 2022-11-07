{

  inputs.packument.url   = "https://registry.npmjs.org/gulplog?rev=13-ed772af76317f3bdda1510aae298b5fa";
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
    ident = "gulplog";
    ldir  = "info/unscoped/g/gulplog";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
