{

  inputs.packument.url   = "https://registry.npmjs.org/log-symbols?rev=51-0af62a65bf2c24ae05e3a6b082db3f6f";
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
    ident = "log-symbols";
    ldir  = "info/unscoped/l/log-symbols";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
