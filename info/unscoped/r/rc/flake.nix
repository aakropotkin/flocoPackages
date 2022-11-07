{

  inputs.packument.url   = "https://registry.npmjs.org/rc?rev=188-008ae019cc9ed3b024c6bb78632c9d53";
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
    ident = "rc";
    ldir  = "info/unscoped/r/rc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
