{

  inputs.packument.url   = "https://registry.npmjs.org/jest-cli?rev=635-205a0b14cdd1a9574d70a549fdce09cc";
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
    ident = "jest-cli";
    ldir  = "info/unscoped/j/jest-cli";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
